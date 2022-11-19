CREATE OR REPLACE type t_registro_amortizacion as object (
  periodo        NUMBER,
  cuota          NUMBER,
  capital        NUMBER,
  interes        NUMBER,
  saldo          NUMBER
   
);

CREATE OR REPLACE type t_tabla_amortizacion as table of t_registro_amortizacion;

--drop type t_tabla_amortizacion;
--drop type t_registro_amortizacion;