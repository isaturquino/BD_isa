SELECT sum(valor) AS valorTotal
FROM granja.Despesa 
WHERE (`dataDespesa` BETWEEN '2024-06-01' AND '2024-06-30');
SELECT sum(valor) AS valorTotal
FROM granja.Despesa
WHERE month(dataDespesa) = 6;