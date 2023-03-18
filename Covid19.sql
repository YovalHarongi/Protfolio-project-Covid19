
Select *
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
order by 3,4



Select location , date , total_cases , new_cases , total_deaths , population
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
order by 1,2



Select location , date , total_cases , total_deaths , (total_deaths/total_cases) as deathPrecentage
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
order by 1,2



Select location , date , total_cases ,population , (total_cases/population) as CasesPrecentage
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
order by 1,2


Select location , population, max(total_cases) as HighestInfectionCount , max(total_cases/population) as CasesPrecentage
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
group by location , population
order by CasesPrecentage desc


Select location , max(cast(total_deaths as int)) as HighestDeatsCount 
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
group by location 
order by HighestDeatsCount desc


Select continent , max(cast(total_deaths as int)) as HighestDeatsCount 
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
group by continent 
order by HighestDeatsCount desc


Select location , max(cast(total_deaths as int)) as HighestDeatsCount 
From [Protfolio Project- covid19] .. [Death Information]
where continent is null 
group by location 
order by HighestDeatsCount desc



Select sum(new_cases) as total_cases , sum(cast(new_deaths as int)) as total_deats , sum(cast(new_deaths as int))/sum(new_cases) as DeathPrecentage
From [Protfolio Project- covid19] .. [Death Information]
where continent is not null 
order by 1,2



Select dea.continent, dea.location , dea.date , dea.population , vac.new_vaccinations
From [Protfolio Project- covid19] .. [Death Information] as dea join [Protfolio Project- covid19] .. [Vaccination Information] as vac 
	on dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3



Select dea.continent, dea.location , dea.date , dea.population , vac.new_vaccinations, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location) 
From [Protfolio Project- covid19] .. [Death Information] as dea join [Protfolio Project- covid19] .. [Vaccination Information] as vac 
	on dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3



with new_new_vaccination (continent, location , date ,population, new_vaccinations, total_vaccinations )
as 
(
Select dea.continent, dea.location , dea.date , dea.population , vac.new_vaccinations, vac.total_vaccinations/population*100
From [Protfolio Project- covid19] .. [Death Information] as dea join [Protfolio Project- covid19] .. [Vaccination Information] as vac 
	on dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null 
)
select *
from new_new_vaccination

