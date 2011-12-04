/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication2;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.rdf.model.ModelFactory;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

//import javax.management.Query;
/**
 *
 * @author lada
 */
public class JavaApplication2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            // KDO ZNA DRACULU
            URLConnection rc = new URL("http://api.sindice.com/v3/search?nq=*%20<http://xmlns.com/foaf/0.1/knows>%20<http://www.example.com/People/Drakula/%23me>").openConnection();
            rc.addRequestProperty("Accept", "application/rdf+xml");
            Model model = ModelFactory.createDefaultModel();
            model.read(new InputStreamReader(rc.getInputStream(), "UTF-8"), "http://drakula/");
            Query query = QueryFactory.create("PREFIX :<http://sindice.com/vocab/search#> PREFIX dc: <http://purl.org/dc/elements/1.1/> PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> SELECT ?uri WHERE { ?x :link ?uri }");

            QueryExecution qe = QueryExecutionFactory.create(query, model);
            ResultSet results = qe.execSelect();

            while (results.hasNext()) {
                QuerySolution solution = results.next();
                
                // SOURCE URL
                String cacheUrl = "http://api.sindice.com/v2/cache?url=";
                URL resource1 = new URL(cacheUrl + solution.get("uri"));
                URLConnection rc1 = resource1.openConnection();
                rc1.setConnectTimeout(3000);
                rc1.addRequestProperty("Accept", "application/rdf+xml");
                model = ModelFactory.createDefaultModel();
                boolean keepTrying = true;
                int limit = 20;
                int iterace=0;
                while (keepTrying) {
                    iterace++;
                    try {
                        model.read(new InputStreamReader(rc1.getInputStream(), "UTF-8"), "http://drakula/");
                        keepTrying = false;
                    } catch (IOException ex) { // casto server error 5xx
                      if(limit< iterace){
                          keepTrying = false;
                      }
                        continue;
                    }
                }
                // VYPARSUJE NAME 
                query = QueryFactory.create("SELECT ?name WHERE { ?x <http://xmlns.com/foaf/0.1/name> ?name }");
                ResultSet results1 = QueryExecutionFactory.create(query, model).execSelect();
                while (results1.hasNext()) {
                    System.out.println("=== " + solution.get("uri") + " ===");
                    System.out.println(results1.next().get("name"));
                }
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
    }
}
