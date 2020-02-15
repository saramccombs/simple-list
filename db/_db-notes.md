# Users

t.string :name
t.string :username
t.string :email
t.string :password

belongs_to :user_role, polymorphic: true

# Parents

t.string :team_name

has_one :user, as: :user_role
has_many :children_parents
has_many :children, through: :children_parents

# Children

t.string :team_name

has_one :user, as: :user_role
has_many :children_parents
has_many :parents, through: :children_parents

# Children_Parents (Join Table)

t.integer :child_id
t.integer :parent_id

# Tasks