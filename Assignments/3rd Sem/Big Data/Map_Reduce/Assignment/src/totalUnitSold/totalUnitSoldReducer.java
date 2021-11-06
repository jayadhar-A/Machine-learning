package totalUnitSold;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.mapreduce.Reducer;
import java.io.IOException;
import org.apache.hadoop.io.Text;

/**
 * @author jayadhar
 *
 */

public class totalUnitSoldReducer extends Reducer<Text, DoubleWritable, Text, DoubleWritable> {

	@Override
	public void reduce(Text key, Iterable<DoubleWritable> values, Context context)
			throws IOException, InterruptedException {

		// Algorithm for finding the sum of all the values
		double sumvValue = 0;
		//double count = 0;
		for (DoubleWritable value : values) {
			//count = count + 1;
			sumvValue = sumvValue + value.get();
		}
		context.write(key, new DoubleWritable(sumvValue));
	}
}
