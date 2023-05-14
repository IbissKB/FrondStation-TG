
<<<<<<< HEAD
/proc/overwrite_field_if_available(datum/data/record/base, datum/data/record/other, field_name)
	if(other.fields[field_name])
		base.fields[field_name] = other.fields[field_name]
=======
/proc/overwrite_field_if_available(datum/record/base, datum/record/other, field_name)
	if(other[field_name])
		base[field_name] = other[field_name]
>>>>>>> 0211ff308517c3a4c9c8c135f9c218015cfecbb7


