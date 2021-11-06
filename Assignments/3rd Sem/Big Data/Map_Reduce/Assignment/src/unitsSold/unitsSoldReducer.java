package unitsSold;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.mapreduce.Reducer;
import java.io.IOException;
import org.apache.hadoop.io.Text;

/**
 * @author jayadhar
 *
 */

public class unitsSoldReducer extends Reducer<Text, DoubleWritable, Text, String> {

	@Override
	public void reduce(Text key, Iterable<DoubleWritable> values, Context context)
			throws IOException, InterruptedException {

		// Algorithm for finding the average of all the values
		double maxValue = 0;
		double minValue = 9999999;
		double count = 0;
		for (DoubleWritable value : values) {
			count = count + 1;
			maxValue = Math.max(maxValue, value.get());
			minValue = Math.min(minValue, value.get());
		}
		//double average_value=sum_value/counter;
		context.write(key, String.valueOf(maxValue) + "," + String.valueOf(minValue));
	}
}
