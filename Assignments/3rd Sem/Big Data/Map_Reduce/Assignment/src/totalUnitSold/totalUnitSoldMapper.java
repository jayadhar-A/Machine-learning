package totalUnitSold;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.LongWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Mapper;

import java.io.IOException;

/**
 * @author jayadhar
 *
 */

public class totalUnitSoldMapper extends Mapper<LongWritable, Text, Text, DoubleWritable> {

	@Override
	public void map(LongWritable key, Text value, Context context) throws IOException, InterruptedException {

		String[] valueArr = value.toString().split(",", 15);

		Configuration conf = context.getConfiguration();
		String country = conf.get("country");
		String itemType = conf.get("item_type");
		

		if (valueArr[2].equals(country) && valueArr[3].equals(itemType)) {
			// The output key is the name of the region
			String outputKey = country + "," + itemType + "," + valueArr[7] + ",";

			// The output value is the magnitude of the earthquake
			double outputValue = Double.parseDouble(valueArr[10]);

			// Record the output in the Context object
			context.write(new Text(outputKey), new DoubleWritable(outputValue));
		}
	}
}
