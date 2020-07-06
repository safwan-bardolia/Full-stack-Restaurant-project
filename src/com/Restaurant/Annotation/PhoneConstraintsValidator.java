package com.Restaurant.Annotation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneConstraintsValidator implements ConstraintValidator<Phone, Long> {

	// actual business logic which return true or false	
	@Override
	public boolean isValid(Long phone, ConstraintValidatorContext arg1) {		//	ConstraintValidatorContext:to give additional error msg
																				//	String :actual string enter by user
		boolean result;
		result = false;
		

		if(phone != null) {
			if(phone.toString().length()==10) {				//it discard the zero if no start with zero (i.e 01234 consider as 1234)
				result = true;
			}
		}else {
			// if phoneNo is null then we return true, because by using @NotNull it display empty message error
			// without this, error message of both @Phone & @NotNull is display if 'phone' field is empty 
			result = true;
		}
		
		return result;
	}

}



/*	public boolean isValid(String phone, ConstraintValidatorContext arg1) {		//	ConstraintValidatorContext:to give additional error msg
																				//	String :actual string enter by user
		boolean result;
		result = false;
		

		if(phone != null) {
			// if user enter zero as prefix then length of phoneNo must be 11 otherwise length must be 10
			if(phone.startsWith("0")) {
				result = phone.length()==11;
			}else {
				result = phone.length()==10;
			}
		}else {
			// if phoneNo is null then we return true, because by using @NotNull it display empty message error
			// without this error message of both @Phone & @NotNull is display if 'phone' field is empty 
			result = true;
		}
		
		return result;
	}
 * */
