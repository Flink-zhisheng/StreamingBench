package com.intel.streaming_benchmark.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class test {
    public static void main(String[] args){
        int threadNum = 40;
        ExecutorService pool = Executors.newFixedThreadPool(threadNum);
        for(int i = 0; i < threadNum; i++){
            pool.execute(new threadTests());
        }
        pool.shutdown();
    }

}
class threadTests extends Thread{
    long i =0;
    long start = System.currentTimeMillis();
    long length = 0;
    boolean flag = true;
    @Override
    public void run() {
        String name = Thread.currentThread().getName();
        byte[]  bytes;
        while(flag){
            bytes = (i + "_" + name + ",").getBytes();
            length = length + bytes.length;
            i++;
            if(System.currentTimeMillis() - start > 10000){
                flag = false;
                System.out.println(i + "   " + length);
            }
        }

    }
}
