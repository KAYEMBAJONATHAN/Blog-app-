create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_likes_on_post_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "author_id"
    t.string "title"
    t.text "text"
    t.integer "comment_counter"
    t.integer "likes_counter"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "photo"
    t.text "bio"
    t.integer "posts_counter"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key :comments, :posts
  add_foreign_key :comments, :users
  add_foreign_key :likes, :posts
  add_foreign_key :likes, :users
  add_foreign_key :posts, :users
  end
end
