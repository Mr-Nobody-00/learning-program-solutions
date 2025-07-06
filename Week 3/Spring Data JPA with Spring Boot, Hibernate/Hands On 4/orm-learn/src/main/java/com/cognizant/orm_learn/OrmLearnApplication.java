package com.cognizant.ormlearn;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import com.cognizant.ormlearn.model.Country;
import com.cognizant.ormlearn.service.CountryService;
import com.cognizant.ormlearn.util.HibernateUtil;

import org.hibernate.Session;

@SpringBootApplication
public class OrmLearnApplication {
    private static final Logger LOGGER = LoggerFactory.getLogger(OrmLearnApplication.class);
    private static CountryService countryService;

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
        countryService = context.getBean(CountryService.class);

        testGetCountryByCode();
        testHibernateGetCountry();
    }

    private static void testGetCountryByCode() {
        LOGGER.info("Start Spring Data JPA");
        Country country = countryService.getCountry("IN");
        LOGGER.debug("Country (Spring Data JPA): {}", country);
        LOGGER.info("End Spring Data JPA");
    }

    private static void testHibernateGetCountry() {
        LOGGER.info("Start Hibernate");
        Session session = HibernateUtil.getSessionFactory().openSession();
        Country country = session.get(Country.class, "IN");
        LOGGER.debug("Country (Hibernate): {}", country);
        session.close();
        LOGGER.info("End Hibernate");
    }
}
