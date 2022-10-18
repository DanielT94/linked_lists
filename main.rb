require_relative 'lib/linked_list'
require_relative 'lib/node'

ll = LinkedList.new
ll.append('second')
ll.append('third')
ll.prepend('first')
ll.append('fourth')
p ll
p ll.size
p ll.head.value
p ll.tail.value
p ll.at(2).value
p ll.pop.value
p ll
p ll.contains?('third')
p ll.contains?('fifth')
p ll.find('second')
p ll.find('45')
p ll.to_s
ll.insert_at('hello', 0)
ll.insert_at('world', 3)
ll.insert_at('!', 5)
p ll.to_s
p ll.size
ll.remove_at(6)
ll.remove_at(5)
p ll.to_s
ll.remove_at(1)
p ll.to_s
ll.remove_at(3)
p ll.to_s
ll.remove_at(0)
p ll.to_s