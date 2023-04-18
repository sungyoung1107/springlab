package com.kbstar.app;

import com.kbstar.frame.TV;
import com.kbstar.tv.LTV;
import com.kbstar.tv.STV;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
    public static void main(String[] args) {
        ApplicationContext factory =
                new ClassPathXmlApplicationContext("spring.xml");

        TV tv =
                (TV) factory.getBean("stv");
        // getBean 안에 stv, ltv spring에 bean id만 변경해주면 된다!!!
        // 역제어 (IoC)

        tv.turnOn();
    }
}
