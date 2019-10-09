ALTER TABLE transactions
    ALTER COLUMN vendor_field_hex SET DATA TYPE varchar(255)
	USING
		CONVERT_FROM(('\x' || ENCODE(vendor_field_hex, 'escape'))::bytea, 'UTF8');

ALTER TABLE transactions RENAME vendor_field_hex TO vendor_field;
