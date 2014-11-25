require 'socket'
require 'timeout'

module PortTest
    def port_open?(ip, port, seconds=1)
        Timeout::timeout(seconds) do
            begin
                TCPSocket.new(ip, port).close
                true
            rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH
                false
            end
        end
    rescue Timeout::Error
        false
    end
    
    def port_check?(ip, port, seconds=10)
        puts "Checking port #{port} on #{ip}"
        timeout = seconds
        while timeout > 0
            return true if port_open?( ip, port )
            puts "Port unreachable, sleeping..."
            sleep 2
        end
        
        puts "Port #{port} cannot be opened - giving up after #{seconds}s"
        false
    end
end