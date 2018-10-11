using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using AS1.Models;

namespace songApi.Controllers
{
    [Route("api/song")]
    [ApiController]
    public class songController : ControllerBase
    {
        private readonly SongContext _context;

        public songController(SongContext context)
        {
            _context = context;

            if (_context.Songs.Count() == 0)
            {
                // Create a new Song if collection is empty,
                // which means you can't delete all Songs.
                _context.Songs.Add(new Song { Name = "Song 1" });
                _context.SaveChanges();
            }
        }

            [HttpGet]
        public ActionResult<List<Song>> GetAll()
        {
            return _context.Songs.ToList();
        }

        [HttpGet("{id}", Name = "GetSong")]
        public ActionResult<Song> GetById(long id)
        {
            var item = _context.Songs.Find(id);
            if (item == null)
            {
                return NotFound();
            }
            return item;
        }

        [HttpPost]
        public IActionResult Create(Song item)
        {
            _context.Songs.Add(item);
            _context.SaveChanges();

            return CreatedAtRoute("GetSong", new { id = item.Id }, item);
        }

        [HttpPut("{id}")]
        public IActionResult Update(long id, Song item)
        {
            var song = _context.Songs.Find(id);
            if (song == null)
            {
                return NotFound();
            }

            song.Artist = item.Artist;
            song.Name = item.Name;

            _context.Songs.Update(song);
            _context.SaveChanges();
            return NoContent();
        }
        [HttpDelete("{id}")]
        public IActionResult Delete(long id)
        {
            var song = _context.Songs.Find(id);
            if (song == null)
            {
                return NotFound();
            }

            _context.Songs.Remove(song);
            _context.SaveChanges();
            return NoContent();
        }
    }
    }