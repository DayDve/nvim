-- функция для упрощения задания значений опций редактора
_G.Set_Config = function(obj, method_name, args_table)
	if type(obj) == "table" and method_name == nil then
		for key, value in pairs(args_table) do
			obj[key] = value
		end
	else
		for _, args in ipairs(args_table) do
			if type(args) == "table" then
				obj[method_name](unpack(args))
			else
				obj[method_name](args)
			end
		end
	end
end
