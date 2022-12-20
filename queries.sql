USE banco_trabalho02;

SELECT *
FROM Conta
WHERE saldo > 10000;

SELECT
    c.nib, cl.unome, COUNT(*) AS contagem
FROM Conta c
    INNER JOIN Titular t ON c.nib = t.nibConta
    INNER JOIN Cliente cl ON t.nifCliente = cl.nif
GROUP BY c.nib, cl.unome
HAVING COUNT(*) >= 2;

SELECT TOP 1 nib, saldo, dataAbertura FROM Conta
WHERE dataFecho IS NULL
ORDER BY dataAbertura ASC;

SELECT p.sigla, COUNT(*) AS 'quantidade de bancos' FROM Pais p
INNER JOIN Banco b ON p.sigla = b.siglaPais
GROUP BY p.sigla;