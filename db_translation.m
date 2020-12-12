function result = db_translation(input_pressure)
P_reference =  2e-5;     % acoustic pressure 2*10e-5 
result = 20 .* log10(input_pressure./P_reference ) ;