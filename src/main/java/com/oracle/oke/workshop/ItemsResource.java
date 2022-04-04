
package com.oracle.oke.workshop;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.ws.rs.BadRequestException;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import java.util.List;

@Path("items")
public class ItemsResource {

    @PersistenceContext(unitName = "test")
    private EntityManager entityManager;

    @GET
    @Produces(MediaType.APPLICATION_JSON)
    public List<Items> getItems() throws BadRequestException {
        return entityManager.createNamedQuery("getItems", Items.class).getResultList();
    }
}
