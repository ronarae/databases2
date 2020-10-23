ALTER TABLE accommodatie
ADD CONSTRAINT accommodatie_code_check
CHECK(length(accommodatie_code) <= 5 and accommodatie_code regexp '[0-9]$');