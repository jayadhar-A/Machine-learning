package topOrders;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.DoubleWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

/**
 * @author jayadhar
 *
 */

public class topOrdersDriver {
	public static void main(String[] args) throws Exception {
		if (args.length < 4) {
			System.err.println("Usage: hadoop fs <input path> <output path> <Year> <Queue Name>");
			System.exit(-1);
		}
		// configuration settings for topOrdersDriver
		Configuration conf = new Configuration();
		conf.set("year", args[2]);
		conf.set("mapred.textoutputformat.separatorText", ",");

		// job specification object for topOrdersDriver
		Job job = new Job(conf);
		job.setJarByClass(topOrdersDriver.class);
		job.setJobName("Average Unit Price");

		// Input and Output Object Path
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));

		// Mapper and Reducer class
		job.setMapperClass(topOrdersMapper.class);
		job.setReducerClass(topOrdersReducer.class);
		job.getConfiguration().set("mapreduce.job.queuename", args[3]);
		
		// Specify the type of output keys and values
		job.setMapOutputKeyClass(DoubleWritable.class);
		job.setMapOutputValueClass(Text.class);
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(DoubleWritable.class);

		// Wait for job to finish before terminating
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}
}
