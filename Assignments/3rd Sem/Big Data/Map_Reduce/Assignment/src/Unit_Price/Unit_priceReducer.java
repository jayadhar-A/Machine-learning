package Unit_Price;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.mapreduce.Reducer;
import java.io.IOException;
import org.apache.hadoop.io.Text;

/**
 * @author jayadhar
 *
 */

public class Unit_priceReducer extends Reducer<Text, DoubleWritable, Text, DoubleWritable> {

	@Override
	public void reduce(Text key, Iterable<DoubleWritable> values, Context context)
			throws IOException, InterruptedException {

		// Algorithm for finding the average of all the values
		double sumValue = 0;
		double count = 0;
		for (DoubleWritable value : values) {
			count = count + 1;
			sumValue = sumValue + value.get();
		}
		double averageValue = sumValue / count;
		context.write(key, new DoubleWritable(averageValue));
	}
}