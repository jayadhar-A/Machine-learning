package topOrders;

import java.io.IOException;

import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Reducer;

/**
 * @author jayadhar
 *
 */

public class topOrdersReducer extends Reducer<DoubleWritable, Text, Text, DoubleWritable> {

	// private TreeMap<Double, String> topOrdersReducer;
	static int count;

	public void setup(Context context) throws IOException, InterruptedException {
		count = 0;
	}

	public void reduce(DoubleWritable key, Iterable<Text> values, Context context)
			throws IOException, InterruptedException {

		double profit = (-1) * key.get();
		String _value = null;

		for (Text value : values) {
			if (value != null)
				_value = value.toString();

			// we have to write maximum of 10 records as output result
			if (count < 10) {
				context.write(new Text(_value), new DoubleWritable(profit));
				count++;
			}
		}

	}
}