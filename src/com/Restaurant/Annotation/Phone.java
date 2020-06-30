package com.Restaurant.Annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

@Constraint(validatedBy = PhoneConstraintsValidator.class)  // actual class which contain business logic that gives you "true" or "false" for actual value entered by user
@Target({ElementType.METHOD, ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
public @interface Phone {
	
	public String message() default "Invalid mobile number";	// All attributes of an annotation type are declared in a method-like manner.
	
	//defines group parameter
	public Class<?>[] groups() default {};
	
	//define default payloads
	public Class<? extends Payload>[] payload() default {}; 
}
