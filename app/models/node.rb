class Node < ActiveRecord::Base
  # belongs_to :parent, :class_name => Node
  belongs_to :left, :class_name => Node, foreign_key: true
  belongs_to :right, :class_name => Node, foreign_key: true

  def insert(other)
    newbie = Node.create(:value => other)
    insert_node(newbie)
  end

  def insert_node(other)
    if other.value < self.value
      if left
        left.insert_node(other)
      else
        self.left = other
      end
    else
      if right
        right.insert_node(node)
      else
        self.right = other
      end
    end
  end

  def count
    total = 1
    total += left.count if left
    total += right.count if right
    return total
  end

  def min
    if left
      left.min
    else
      self.value
    end
  end

  def max
    if right
      right.max
    else
      self.value
    end
  end
end
# if you don't like your problem, create another problem
# identifying the problem at hand, is it two, three or even four problems and then addressing them
