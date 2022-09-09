<li class="nav-item">
            <%= link_to new_course_path, class: "nav-link" do %>
              <i class="fa-solid fa-plus"></i> New Courses
            <% end %>
          </li>
          <li class="nav-item">
            <%= link_to users_path, class: "nav-link" do %>
              <i class="fa-solid fa-users"></i> Users
            <% end %>
          </li>
          <li class="nav-item">
            <%= link_to pages_activity_path, class: "nav-link" do %>
              <i class="fa-solid fa-bell"></i> Activity
            <% end %>
          </li>
          <li class="nav-item">
            <%= link_to enrollments_path, class: "nav-link" do %>
              <i class="fa-solid fa-lock-open"></i> Enrollments
            <% end %>
          </li>