# frozen_string_literal: true
class Ability
      include CanCan::Ability  
    
      def initialize(user)
        can :read, Listing, public: true
    
        if user.present?  # additional permissions for logged in users (they can read their own posts)
          can :read, Listing, user_id: user.id
         
    
          if user.admin?  # additional permissions for administrators
            can :manage, :all
          else
            can :read, :all
            
          end #is this enough ends?
          #users are able to edit and delete their own listings and manage their own accounts
      can :create, Listing
      can [:edit, :update, :destroy], Listing, user_id: user.id
      can [:edit, :update, :destroy], User, user_id: user.id
        end
      end
      
    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
#   end
# end
