package it.unipi.DSMT.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import it.unipi.DSMT.dao.base.BaseRedisDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@WebListener
public class AppServletContextListener implements ServletContextListener {
    private static final Logger logger = LoggerFactory.getLogger(AppServletContextListener.class);

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
