package it.unipi.DSMT.config;

import it.unipi.DSMT.dao.base.BaseRedisDAO;
import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;


@WebListener
public class AppServletContextListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        BaseRedisDAO.initPool();
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        BaseRedisDAO.closePool();
    }

}
