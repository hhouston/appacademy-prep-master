def measure(times = 1, &prc)
  start_time = Time.now
  times.times { prc.call }
  elapsed_time = (Time.now - start_time)/times
end
