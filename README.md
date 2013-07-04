DelayedThread
=============

DelayedThread constructs threads with delayed execution.

Usage
-----

    d = DelayedThread.new
    
Add a delayed thread

    d.delayed_thread do
      5.times do |x|
        puts x.to_s
        sleep 1
      end
    end

Add another delayed thread

    d.delayed_thread do
      5.times do |x|
        puts (x * 2).to_s
        sleep 1
      end
    end
    
wait some time

    sleep 2
    
start delayed thread execution

    d.start
    
join delayed threads

    d.join

Do not delay threads

    d.delayed = false
    
Get list of delyaed threads

    d.threads # => Array
    
