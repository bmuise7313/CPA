using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using AS1.Models;

namespace ReviewApi.Controllers
{
    [Route("api/Review")]
    [ApiController]
    public class ReviewController : ControllerBase
    {
        private readonly ReviewContext _context;

        public ReviewController(ReviewContext context)
        {
            _context = context;

            if (_context.Reviews.Count() == 0)
            {
                // Create a new ReviewItem if collection is empty,
                // which means you can't delete all ReviewItems.
                _context.Reviews.Add(new Review { reviewName = "Item1" });
                _context.SaveChanges();
            }
    }
        [HttpGet]
        public ActionResult<List<Review>> GetAll()
        {
            return _context.Reviews.ToList();
        }

        [HttpGet("{id}", Name = "GetReview")]
        public ActionResult<Review> GetById(long id)
        {
            var item = _context.Reviews.Find(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }

        [HttpPost]
        public IActionResult Create(Review item)
        {
            _context.Reviews.Add(item);
            _context.SaveChanges();

            return CreatedAtRoute("GetReview", new { id = item.Id }, item);
        }

        [HttpPut("{id}")]
        public IActionResult Update(long id, Review item)
        {
            var review = _context.Reviews.Find(id);
            if (review == null)
            {
                return NotFound();
            }
            review.songId = item.songId;
            review.reviewName = item.reviewName;
            review.songName = item.songName;
            review.review = item.review;

            _context.Reviews.Update(review);
            _context.SaveChanges();
            return NoContent();
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(long id)
        {
            var review = _context.Reviews.Find(id);
            if (review == null)
            {
                return NotFound();
            }

            _context.Reviews.Remove(review);
            _context.SaveChanges();
            return NoContent();
        }
    }
}