package com.kh.fooding.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class BeforeAdvice {
	@Pointcut("execution(* com.kh.fooding..*ServiceImpl.*(..))")
	public void servicePointcut(){}
	@Pointcut("execution(* com.kh.fooding..*DaoImpl.*(..))")
	public void daoPointcut(){}
	
	@Before("daoPointcut()")
	public void beforeLog(JoinPoint jp){
		//메소드가 실행되기 전 공통으로 처리할 작업을 위해 사용된다.
		String methodName = jp.getSignature().getName();
		Object[] args = jp.getArgs();
		
		System.out.println("[메소드 호출 전 확인] : " + methodName 
						+ "() 메소드의 매개변수 갯수 : " + args.length);
		for(int i = 0; i < args.length; i++){
			System.out.println(i + "번째 매개변수 정보 : " + args[i].toString());
		}
		
	}
	
}
