package it.unipi.DSMT.config;


import it.unipi.DSMT.dao.base.BaseRedisDAO;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebListener
public class AppServletContextListener implements ServletContextListener {
    private static final Logger logger = LoggerFactory.getLogger(AppServletContextListener.class.getName());

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        logger.info("ServletContextListener started");
        BaseRedisDAO.initPool();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        logger.info("ServletContextListener destroyed");
        BaseRedisDAO.closePool();
    }

}
