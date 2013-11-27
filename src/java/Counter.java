/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author elfinositompul
 */
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author elfinositompul
 */

package webs;

public class Counter {
    private static int count;
    public static synchronized int getCount(){
        count++;
        return count;
    }
}
