# load_test
load test api to test posgres efficiency in an elixir phoenix API 


# Setup guides:

  * Install dependencies with `mix deps.get`
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

# Set database data:

inside your postgres app:

 ```
 \copy animales from './animales.csv' WITH DELIMITER ',' CSV HEADER;
 
  \copy gastos from '.gastos.csv' WITH DELIMITER ',' CSV HEADER;
 
 ```
 
 
 ##Http request to test when load test (most hard load cases to test)
 
 ![Captura desde 2023-03-03 02-01-31](https://user-images.githubusercontent.com/72921055/222605329-2f3fd362-843e-4181-aba2-7eb1eab809aa.png)

![Captura desde 2023-03-03 02-01-58](https://user-images.githubusercontent.com/72921055/222605374-f41ab447-4016-48f7-a9cb-974627cd226e.png)

# Branches and tools
Since I want to compare results of diferent load testing tools, there will be diferent branchs with the tool in the name of the branch and the readme 
will contain the result in my computer in perfect conditions (no strange tasks in process). This way configurations won't afect each other tool.


#

Then please visit http://localhost:4000 or access to any of the endpoints configured at router.ex



![Gracias por visitar el repositorio](https://geekytheory.com/content/images/2014/05/Cat-Illustrations-024.jpg)


**MUCHAS GRACIAS POR VISITAR EL REPOSITORIO**

**THANK YOU SO MUCH FOR VISITING THE REPOSITORY**
