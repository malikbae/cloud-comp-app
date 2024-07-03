import main from "../assets/images/job-hunt.svg";
import Wrapper from "../assets/wrappers/LandingPage";
import { Logo } from "../components";
import { Link } from "react-router-dom";
const Landing = () => {
  return (
    <Wrapper>
      <nav>
        <Logo />
      </nav>
      <div className="container page">
        {/* info */}
        <div className="info">
          <h1>
            note your <span>career</span> journey
          </h1>
          <p>
            Find ease in tracking and managing all your job applications with JobsJourney. Designed for modern job seekers, JobsJourney is the app that helps you keep track of every step in your job search, from the first application to the
            job offer.
          </p>
          <Link to="/register" className="btn btn-hero">
            login/Register
          </Link>
        </div>
        <img src={main} alt="job hunt" className="img main-img" />
      </div>
    </Wrapper>
  );
};

export default Landing;
