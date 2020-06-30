package com.Restaurant.Aspect;

import java.util.logging.Logger;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

// register given class as an aspect, so it listen communication behind the scene
@Aspect
@Component
public class LoggingAspect {

	private Logger logger = Logger.getLogger(getClass().getName());	
	
	// we need logging to console before & after execution of each methode of Controller,Service & DAO package	& our custome annotation
	
	//	pointcut declaration for Controller
	@Pointcut("execution(* com.Restaurant.Controller.*.*(..))")
	public void forController() {}

	//	pointcut declaration for Service	
	@Pointcut("execution(* com.Restaurant.Service.*.*(..))")
	public void forService() {}
	
	//	pointcut declaration for DAO	
	@Pointcut("execution(* com.Restaurant.DAO.*.*(..))")
	public void forDAO() {}
	
	@Pointcut("execution(* com.Restaurant.Annotation.*.*(..))")
	public void forAnnotation() {}
	
	//	combining all pointcut together
	@Pointcut("forController() || forService() || forDAO() || forAnnotation()")
	public void appFlow() {}
	
	
	// @Before advice
	@Before("appFlow()")
	public void before(JoinPoint joinPoint) {
		
		// display methode we are calling
		String theMethod = joinPoint.getSignature().toShortString();
		logger.info("=====>> in @Before: calling methode is : "+theMethod);
		
		// display the arguments which is passed to methode
		Object[] args = joinPoint.getArgs();
		
		// loop through & display args		
		for(Object i: args) {
			logger.info("=====>>in @Before: argument is : "+i);
		}
		
	}
	
	// @AfterReturning advice (run after successful execution of  methodes of Controller,DAO or Service pkg)
	@AfterReturning(pointcut = "appFlow()", returning = "result")
	public void afterReturning(JoinPoint joinPoint, Object result) {

		// display methode we are returning from
		String theMethod = joinPoint.getSignature().toShortString();
		logger.info("=====>> in @AfterReturning: returning from methode: "+theMethod);
		
		// display data returned if ant
		logger.info("=====>> in @AfterReturning: data return is: "+ result);
		
	}
}
