class ReportsController < ApplicationController

  def highest_cpu
    @node = nil
    Node.all.each do |node|
      if !@node or node.stats['uw_cpuused'] > @node.stats['uw_cpuused']
        @node = node
      end
    end
  end

  def low_disk_space
    @nodes = []
    Node.all.each do |node|
      if node.stats['uw_diskused_perc'] > 80
        @nodes << node
      end
    end

  end

end
