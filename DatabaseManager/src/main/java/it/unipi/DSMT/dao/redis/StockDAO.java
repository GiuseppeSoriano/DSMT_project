package it.unipi.DSMT.dao.redis;

import it.unipi.DSMT.dao.base.BaseRedisDAO;
import it.unipi.DSMT.model.StockData;
import redis.clients.jedis.resps.Tuple;

import java.util.List;
import java.util.Set;

public class StockDAO extends BaseRedisDAO {

    public List<Tuple> getStockHistory(String ticker, Long timestamp){
        try(var jedis = getConnection()) {
            return jedis.zrangeByScoreWithScores(ticker, timestamp, Double.POSITIVE_INFINITY);
        }
        catch (Exception e){
            return null;
        }
    }

    public void saveStockData(StockData data) {
        try (var jedis = getConnection()) {

            String key = data.getTicker();

            double score = data.getTimestamp();

            String member = data.getPrice().toString() + ":" + data.getTimestamp();

            jedis.zadd(key, score, member);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
