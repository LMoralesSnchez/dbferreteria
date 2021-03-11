SELECT 
  factura.precio_total
FROM 
  public.factura;

SELECT * FROM factura

create or replace function tr_comision() RETURNS TRIGGER
as
$tr_comision$
begin
	
	if(new.precio_total>=100) then raise notice 'El empleado tiene una comision por vender 100 dolar en una factura';
	end if;
	return new;
end

$tr_comision$
language plpgsql;


create trigger tr_comision before insert or update on factura
	for each row execute procedure tr_comision();


INSERT INTO FACTURA values('F0190',2,19,121,'Gracias por su compra','2020/12/04',12,235.52);
