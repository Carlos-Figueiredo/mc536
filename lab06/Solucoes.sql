/*EXERCICIOS*/
# 7 ------------------------------------------------------------------------------------
SELECT C1.MATR,
		C1.ULTIMA_PROMOCAO AS DATA_PROMOCAO,
		MAX(CF1.DATA_PROMOCAO) AS DATA_PROMOCAO_ANTERIOR
FROM
		(
			SELECT MATR,
					MAX(DATA_PROMOCAO) AS ULTIMA_PROMOCAO
			FROM CARGO_FUNC
			WHERE DATA_PROMOCAO <= CURDATE()
			GROUP BY MATR
		) C1
		INNER JOIN (select matr, data_promocao from CARGO_FUNC) CF1
		ON C1.MATR = CF1.MATR AND CF1.DATA_PROMOCAO < C1.ULTIMA_PROMOCAO
GROUP BY C1.MATR
ORDER BY C1.MATR;

# 8 ------------------------------------------------------------------------------------
SELECT C1.MATR,
		C1.ULTIMA_PROMOCAO AS ULTIMA_DATA_PROMOCAO,
		MAX(CF1.DATA_PROMOCAO) AS PENULTIMA_DATA_PROMOCAO,
		MAX(CF2.DATA_PROMOCAO) AS ANTEPENULTIMA_DATA_PROMOCAO
FROM
		(
			SELECT MATR,
					MAX(DATA_PROMOCAO) AS ULTIMA_PROMOCAO
			FROM CARGO_FUNC
			WHERE DATA_PROMOCAO <= CURDATE()
			GROUP BY MATR
		) C1
		LEFT JOIN (
			SELECT MATR,
					DATA_PROMOCAO
			FROM CARGO_FUNC
		) CF1
		ON C1.MATR = CF1.MATR AND CF1.DATA_PROMOCAO < C1.ULTIMA_PROMOCAO
		LEFT JOIN 
		(
			SELECT MATR,
					DATA_PROMOCAO 
			FROM CARGO_FUNC
			GROUP BY MATR
		) CF2
		ON CF2.MATR = CF1.MATR AND CF2.DATA_PROMOCAO < CF1.DATA_PROMOCAO
		
GROUP BY C1.MATR
ORDER BY C1.MATR;

# 9 ------------------------------------------------------------------------------------
SELECT C1.MATR,
		F.NOME,
		C1.ULTIMA_PROMOCAO AS ULTIMA_DATA_PROMOCAO,
		MAX(CF1.DATA_PROMOCAO) AS PENULTIMA_DATA_PROMOCAO
FROM
		(
			SELECT MATR,
					MAX(DATA_PROMOCAO) AS ULTIMA_PROMOCAO,
					SALARIO
			FROM CARGO_FUNC
			WHERE DATA_PROMOCAO <= CURDATE()
			GROUP BY MATR
		) C1
		LEFT JOIN (
			SELECT MATR,
					DATA_PROMOCAO,
					SALARIO
			FROM CARGO_FUNC
		) CF1
		ON C1.MATR = CF1.MATR AND CF1.DATA_PROMOCAO < C1.ULTIMA_PROMOCAO
		LEFT JOIN (
			SELECT MATR,
				NOME
			FROM FUNC
		) F
		ON F.MATR = C1.MATR
		
		
GROUP BY C1.MATR
ORDER BY C1.MATR;
# 10 -----------------------------------------------------------------------------------
# 11 -----------------------------------------------------------------------------------
# 12 -----------------------------------------------------------------------------------
# 13 -----------------------------------------------------------------------------------
