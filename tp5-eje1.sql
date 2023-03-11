--1. Lista el apellido de todos los empleados.
SELECT apellido FROM empleados;

--2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido FROM empleados;

--3. Lista todas las columnas de la tabla empleados.
SELECT * FROM empleados;

--4. Lista el nombre y apellido de todos los empleados.
SELECT nombre, apellido FROM empleados;

--5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
SELECT cuil_cuit FROM empleados;

--6. Lista el nombre y apellido de los empleados en una única columna.
SELECT concat_ws(' ', nombre, apellido) AS Nombre_y_Apellido FROM empleados;

--7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT upper(concat ( nombre,' ',apellido)) AS Nombre_y_Apellido FROM empleados;

--8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT lower(concat ( nombre,' ',apellido)) AS Nombre_y_Apellido FROM empleados;

--9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre,presupuesto FROM departamentos ORDER BY presupuesto ASC;

--10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre FROM departamentos ORDER BY nombre ASC;

--11. Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre FROM departamentos ORDER BY nombre DESC;

--12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
SELECT apellido,nombre from empleados ORDER BY apellido,nombre ASC;

--13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre,presupuesto FROM sistema.departamentos ORDER BY presupuesto desc LIMIT 3;

--14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre,presupuesto FROM sistema.departamentos ORDER BY presupuesto asc LIMIT 3;

--15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
SELECT nombre,presupuesto FROM sistema.departamentos WHERE presupuesto >= 150000;

--16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre,presupuesto FROM sistema.departamentos WHERE presupuesto >= 100000 AND presupuesto <= 200000;

--17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre,presupuesto FROM sistema.departamentos WHERE NOT (presupuesto >= 100000 AND presupuesto <= 200000);

--18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre FROM sistema.departamentos WHERE presupuesto BETWEEN 100000 AND 200000;

--19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre FROM sistema.departamentos WHERE NOT presupuesto BETWEEN 100000 AND 200000;

--20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT empleados.nombre,empleados.apellido,departamentos.nombre FROM empleados INNER JOIN departamentos ON empleados.id_departamento=departamentos.iddepartamento;

--21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
SELECT departamentos.nombre,empleados.apellido,empleados.nombre FROM empleados INNER JOIN departamentos ON empleados.id_departamento=departamentos.iddepartamento ORDER BY departamentos.nombre,empleados.apellido,empleados.nombre ASC;

--22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT DISTINCT departamentos.iddepartamento,departamentos.nombre FROM empleados INNER JOIN departamentos ON empleados.id_departamento=departamentos.iddepartamento;

--23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
SELECT departamentos.nombre FROM departamentos INNER JOIN empleados ON empleados.id_departamento=departamentos.iddepartamento WHERE cuil_cuit = '27-38382980-3';

--24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
SELECT departamentos.nombre FROM departamentos INNER JOIN empleados ON empleados.id_departamento=departamentos.iddepartamento WHERE apellido = 'ruiz' AND empleados.nombre = 'Pepe';

--25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT empleados.apellido,empleados.nombre,empleados.cuil_cuit FROM empleados INNER JOIN departamentos ON empleados.id_departamento=departamentos.iddepartamento WHERE departamentos.nombre = 'I+D' ORDER BY empleados.apellido,empleados.nombre ASC;

--26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT empleados.apellido,empleados.nombre,empleados.cuil_cuit FROM empleados INNER JOIN departamentos ON empleados.id_departamento=departamentos.iddepartamento WHERE departamentos.nombre = 'sistemas' OR departamentos.nombre = 'contabilidad' OR departamentos.nombre = 'I+D' ORDER BY empleados.apellido,empleados.nombre ASC;

--27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
SELECT empleados.nombre FROM empleados INNER JOIN departamentos ON empleados.id_departamento=departamentos.iddepartamento WHERE NOT departamentos.presupuesto BETWEEN 100000 AND 200000;
