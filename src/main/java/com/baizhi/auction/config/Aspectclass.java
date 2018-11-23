package com.baizhi.auction.config;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.context.annotation.Configuration;

@Aspect
@Configuration
public class Aspectclass {

   /* //前置增强
    @Before("execution(* com.baizhi.auction.service.*.*(..))")
    public void before(JoinPoint joinPoint){
        System.out.println("前置增强  "+joinPoint);
    }

    //后置增强
    @After("execution(* com.baizhi.auction.service.*.*(..))")
    public void after(JoinPoint joinPoint){
        System.out.println("后置增强  "+joinPoint);
    }*/

   //环绕增强
    @Around(value = "execution(* com.baizhi.auction.service.*.*(..))")
    public Object around(ProceedingJoinPoint proceedingJoinPoint){

        System.out.println("环绕增强之前");
        Object prout=null;
        try {
            prout=proceedingJoinPoint.proceed();
            System.out.println("环绕增强之后");
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
        return prout;
    }
}
