require 'thread'

class DelayedThread
  attr_accessor :threads, :delayed
  
  def initialize
    @threads = Array.new
    @hold = ConditionVariable.new
    @mutex  = Mutex.new
    @delayed = true
  end
  
  def delayed_thread
    thread = Thread.new do
      @delayed && @mutex.synchronize {
        @hold.wait(@mutex)
      }
      yield
    end
    @threads << thread
    thread
  end # => Thread
  
  def start
    @hold.broadcast
   end
   
   def join
     @threads.each {|thread| thread.join}
   end
end
