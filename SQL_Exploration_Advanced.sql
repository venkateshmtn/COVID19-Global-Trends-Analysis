
-- Ensuring zero-division protection and handling nulls dynamically
select 
location,
date,
total_cases,
total_deaths, 
(cast(total_deaths as float)/nullif(cast(total_cases as float),0)) * 100.0 as death_percentage
from [dbo].[CovidDeaths] 
where continent is not null
order by 1,2

-- Calculating the day-over-day growth rate of new cases

select 
location,
date,
new_cases,
LAG(new_cases) over(partition by location order by date) as previous_day_cases,
new_cases-LAG(new_cases) over(partition by location order by date)
/nullif(LAG(new_cases) over(partition by location order by date),0) * 100 as GrowthRate
from [dbo].[CovidDeaths] where continent is not null

-- Identifying the top 3 highest infection days per country
with RankedInfections as(
select
location,
date,
new_cases,
DENSE_RANK() over(partition by location order by new_cases desc) as casesrank
from [dbo].[CovidDeaths]
)
select * from RankedInfections where casesrank<=3

-- Efficiently storing rolling vaccination data for multi-step analysis
create table #PercentPopulationVaccinated (
Continent nvarchar(50),
Location nvarchar(50),
Date datetime,
Population numeric,
New_Vaccinations numeric,
RollingPeopleVaccinated numeric
)
create or alter view PercentPopulationVaccinated as 
select 
dea.continent,
dea.location,
dea.date,
dea.population,
vac.new_vaccinations,
SUM(try_cast(vac.new_vaccinations as bigint)) over(partition by dea.location order by dea.date) as RollingPeopleVaccinated
from  [dbo].[CovidDeaths] dea
join [dbo].[CovidVaccinations] vac on 
dea.location=vac.location and dea.date=vac.date

select *, (cast(RollingPeopleVaccinated as float)/nullif(cast(Population as float),0)) * 100 as VaccinationPercentage  from [dbo].[PercentPopulationVaccinated]

-- Create a reusable tool to fetch stats for any specific country
go
create or alter procedure GetCountryCovidStats
    @LocationName nvarchar(100)
as 
begin
select
location,
max(total_cases) as total_cases, 
max(total_deaths) as total_deaths,
(max(cast(total_deaths as float))/nullif(max(cast(total_cases as float)),0)) * 100 as MortalityRate 
from CovidDeaths
where location like '%'+ @LocationName +'%'
group by location
end
go

exec GetCountryCovidStats @LocationName='India'  