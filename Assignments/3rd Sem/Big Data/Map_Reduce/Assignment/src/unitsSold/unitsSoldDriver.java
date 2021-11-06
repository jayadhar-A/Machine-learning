package unitsSold;

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

public class unitsSoldDriver {

	public static void main(String[] args) throws Exception {
		if (args.length < 3) {
			System.err.println("Usage: hadoop fs <input path> <output path> <Item Type> <Queue Name>");
			System.exit(-1);
		}

		// configuration settings for unitsSoldDriver
		Configuration conf = new Configuration();
		conf.set("item_type", args[2]);
		conf.set("mapred.textoutputformat.separatorText", ",");
		
		//job specification object for unitsSoldDriver
		Job job = new Job(conf);
		job.setJarByClass(unitsSoldDriver.class);
		job.setJobName("Average Unit Price");
		job.setNumReduceTasks(10); // 10 reducers

		// Input and Output Object Path
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));

		//Mapper and Reducer class
		job.setMapperClass(unitsSoldMapper.class);
		job.setReducerClass(unitsSoldReducer.class);

		//Partitioner Class
		job.setPartitionerClass(unitsSoldPart.class);
		job.getConfiguration().set("mapreduce.job.queuename", args[3]);

		// Specify the type of output keys and values
		job.setOutputKeyClass(Text.class);
		job.setOutputValueClass(DoubleWritable.class);

		// Wait for job to finish before terminating
		System.exit(job.waitForCompletion(true) ? 0 : 1);
	}
}