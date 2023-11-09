package web.util;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAspect {
	private final Logger logger = LoggerFactory.getLogger( this.getClass() );
	
	@Autowired HttpServletRequest req;
	
	@Before("bean(*Controller)")
	public void defaultControllerLog(JoinPoint jp) {
		logger.info("{} [{}]", req.getRequestURI(), req.getMethod());
	}
	
	@Before("bean(*ServiceImpl)")
	public void defaultServiceLog(JoinPoint jp) {
		logger.info("{}", req.getRequestURI(), req.getMethod());
	}

}
