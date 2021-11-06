package topOrders;

import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

/**
 * @author jayadhar
 *
 */

public class topOrdersMapper extends Mapper<Object, Text, DoubleWritable, Text> {

	@Override
	public void map(Object key, Text value, Context context) throws IOException, InterruptedException {

		String[] valueArr = value.toString().split(",", 16);
		Configuration conf = context.getConfiguration();
		String year = conf.get("year");

		if (valueArr[7].equals(year)) {
			String outputKey = year + "," + valueArr[8] + ",";
			double outputKeyValue = -1 * Double.parseDouble(valueArr[15]);

			context.write(new DoubleWritable(outputKeyValue), new Text(outputKey));
		}
	}
}