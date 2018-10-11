using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Assignment1.Models;
using Microsoft.EntityFrameworkCore;
namespace Assignment1
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddDbContext<SongContext>(opt =>
                opt.UseInMemoryDatabase("SongList"));
            services.AddMvc();


        }

        public void Configure(IApplicationBuilder app)
        {
            app.UseMvc();
        }
    }
}
