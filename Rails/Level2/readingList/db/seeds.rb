Book.destroy_all

Book.create!([{
	title: "Zero to One",
	author: "Peter Thiel",
	description: "Zero to One is a refreshing intellectual deep dive into the motives behind entrepreneurship. It’s full of unique, practical insights, and discusses success in terms of human nature and culture. Along with business strategy, Thiel outlines how successful innovation shapes society and shares an intriguing vision.",
	amazon_id: "0804139296",
	rating: 5,
	finished_on: 10.days.ago,
},
{
	title: "The Lean Startup",
	author: "Eric Ries",
	description: "Most startups fail. But many of those failures are preventable.  The Lean Startup is a new approach being adopted across the globe, changing the way companies are built and new products are launched.",
	amazon_id: "0307887898",
	rating: 4,
	finished_on: 5.days.ago,
},
{
	title: "Elon Musk",
	author: "Ashley Vance",
	description: "In Elon Musk: Tesla, SpaceX, and the Quest for a Fantastic Future, veteran technology journalist Ashlee Vance provides the first inside look into the extraordinary life and times of Silicon Valley's most audacious entrepreneur. Written with exclusive access to Musk, his family and friends, the book traces the entrepreneur's journey from a rough upbringing in South Africa to the pinnacle of the global business world.",
	amazon_id: "0062301233",
	rating: 5,
	finished_on: nil,
}])

p "Created #{Book.count} books"